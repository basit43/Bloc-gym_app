String formatTime(int seconds, bool pad) {
  return (pad)
      ? '${(seconds / 60).floor()}:${(seconds % 60).toString().padLeft(2, '0')}'
      : (seconds > 59)
          ? '${(seconds / 60).floor()}:${(seconds % 60).toString().padLeft(2, '0')}'
          : seconds.toString();
}
