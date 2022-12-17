import java.io.File;
import java.io.IOException;

public class FileDemo {



    public static void main(String[] args) throws IOException {
        File file = new File("./txt/demo.txt");
        if(!file.exists()){
            System.out.println(file.getParentFile().mkdir());
            System.out.println(file.createNewFile());
        }
        System.out.println("创建成功");
    }
}
