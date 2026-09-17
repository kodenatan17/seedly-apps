import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seedly_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:seedly_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:seedly_app/features/auth/presentation/bloc/auth_state.dart';

// TODO: Add OTP request entry point once that usecase lands.
class LoginScreen extends StatelessWidget {
  const LoginScreen({this.onSignInSuccess, super.key});

  /// Host-supplied navigation callback, mirroring `MissionListScreen`'s
  /// `onMissionSelected` — the screen itself never imports `go_router`.
  final VoidCallback? onSignInSuccess;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            onSignInSuccess?.call();
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoading;
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Login'),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: isLoading
                      ? null
                      : () => context.read<AuthBloc>().add(
                          const GoogleSignInRequested(),
                        ),
                  icon: isLoading
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.login),
                  label: const Text('Sign in with Google'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
