import haxe.io.Bytes;
import sys.io.File;

class Swap{
    static function main() {
        var filename = "sfa3.bin";
        var infile = File.getBytes(filename);
        var outname = "swapped.bin";
        var size = 0x400000;

        swap(infile);
        
        savefile(outname,infile,0,size);
    }

    public static function swap(f) {
        for(i in 0...0x1ffffe){
            var b1 = f.get(i*2);
            var b2 = f.get((i*2)+1);
            f.set(i*2,b2);
            f.set((i*2)+1,b1);
        }
    }

    public static function savefile(name,src,location,size){
        var newfile = Bytes.alloc(size);
        newfile.blit(0,src,location,size);		
        File.saveBytes(name,newfile);
    }


}