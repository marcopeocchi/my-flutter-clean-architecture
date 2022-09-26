import 'package:flutter/material.dart';
import 'package:my_flutter_clean_architecture/core/error_handling/failure.dart';

class FailureWidget extends StatelessWidget {
  final Failure failure;

  const FailureWidget({super.key, required this.failure});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.red.shade200,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 25),
                    const Icon(
                      Icons.warning_rounded,
                      color: Colors.white60,
                      size: 70,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Error code: ${failure.code}',
                      style: const TextStyle(
                        color: Color.fromARGB(125, 0, 0, 0),
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Center(
                      child: Text(
                        failure.message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color.fromARGB(125, 0, 0, 0),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
