import haxe.io.Bytes;
import haxe.io.Eof;

class SysStdinEof {
    static function main() {
        var input = Sys.stdin();
        var operation = Sys.args()[0];

        if (operation == "readBytesZero") {
            final read = input.readBytes(Bytes.alloc(0), 0, 0);
            if (read != 0)
                throw 'Expected a zero-length read to return 0, got $read';
            Sys.println("zero");
            return;
        }

        try {
            switch (operation) {
                case "readByte":
                    input.readByte();
                case "readBytes":
                    input.readBytes(Bytes.alloc(1), 0, 1);
                case other:
                    throw 'Unknown operation: $other';
            }
        } catch (_:Eof) {
            Sys.println("eof");
            return;
        }

        throw 'Expected $operation to throw haxe.io.Eof';
    }
}
