import js.node.Os;

class OsStaticMethods {
	static function main() {
		final temporaryDirectory = Os.tmpdir();
		if (temporaryDirectory.length == 0)
			throw "Expected os.tmpdir() to return a directory";

		final totalMemory = Os.totalmem();
		if (totalMemory <= 0)
			throw "Expected os.totalmem() to return a positive byte count";

		Sys.println("os static methods verified");
	}
}
