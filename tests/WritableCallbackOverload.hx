import js.Node;
import js.node.Buffer;
import js.node.stream.Writable.IWritable;

class WritableCallbackOverload {
	static function main() {
		final writable:IWritable = Node.process.stdout;
		writable.write(Buffer.from("writable callback overload verified\n"), () -> {});
		writable.write("writable encoding verified\n", "utf8", () -> {});
	}
}
