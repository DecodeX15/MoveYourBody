import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/onnx_service.dart';
import '../services/tokenizer_service.dart';
import '../services/cosine_similairty.dart'; // Import exact file name check kar lena

part 'ai_inference_view_model.g.dart';

class AiState {
  final bool isReady;
  final bool isProcessing;
  final String? bestMatchResult;

  const AiState({
    this.isReady = false,
    this.isProcessing = false,
    this.bestMatchResult,
  });

  AiState copyWith({bool? isReady, bool? isProcessing, String? bestMatchResult}) {
    return AiState(
      isReady: isReady ?? this.isReady,
      isProcessing: isProcessing ?? this.isProcessing,
      bestMatchResult: bestMatchResult ?? this.bestMatchResult,
    );
  }
}

@Riverpod(keepAlive: true)
class AiInferenceViewModel extends _$AiInferenceViewModel {
  final _tokenizer = TokenizerService();
  final _onnx = OnnxService();

  @override
  AiState build() {
    _initEngine();
    return const AiState();
  }

  Future<void> _initEngine() async {
    await _tokenizer.init();
    await _onnx.init();
    
    if (!ref.mounted) return;
    state = state.copyWith(isReady: true);
    debugPrint("AI Engine: Status is READY");
  }

  /// Process user query against a dynamic database map passed at runtime
  Future<void> processUserQuery({
    required String query,
    required Map<String, List<double>> targetEmbeddingsDb, // Future real injections
  }) async {
    if (!state.isReady) {
      debugPrint("AI Engine: Engine is not ready yet!");
      return;
    }

    state = state.copyWith(isProcessing: true);

    final userInputs = _tokenizer.encode(query);
    if (userInputs != null) {
      final userEmbedding = await _onnx.runInference(
        userInputs['input_ids']!,
        userInputs['attention_mask']!,
        userInputs['token_type_ids']!,
      );

      if (!ref.mounted) return;

      String bestMatch = "No Match Found";
      double highestScore = -1.0;

      // 🏆 Dynamic map vector comparison loop setup
      for (var entry in targetEmbeddingsDb.entries) {
        double score = SimilarityUtils.calculateCosineSimilarity(userEmbedding, entry.value);
        if (score > highestScore) {
          highestScore = score;
          bestMatch = entry.key;
        }
      }

      state = state.copyWith(
        isProcessing: false,
        bestMatchResult: bestMatch,
      );
    } else {
      if (!ref.mounted) return;
      state = state.copyWith(isProcessing: false, bestMatchResult: "Error parsing query");
    }
  }
}