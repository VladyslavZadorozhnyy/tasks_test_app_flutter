class Task {
  Task ({
    required this.id,
    this.executed = false,
  });

  final int id;
  bool executed;

  Future<void> execute() {
    executed = true;
    return Future.delayed(
      const Duration(
        seconds: 5,
        ),
      );
  }
}