package Controller;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Controller {
    String pathName;
    private String get(String name) {

        StringBuilder joint = new StringBuilder();
        Scanner scan  = null;
        if(name.equals("users")){
            pathName = "src/Data/users.json";
        }
        else
            pathName = "src/Data/list.json";

        try {
            scan = new Scanner(new File(pathName));
        } catch (FileNotFoundException e) {
            System.out.println("Exit");
        }
        while (scan.hasNextLine()){
            joint.append(scan.nextLine());
        }
        return joint.toString();
    }

    private String send(String str,String name){
        if(name.equals("users")){
            pathName = "src/Data/users.json";
        }
        else
            pathName = "src/Data/list.json";
        try {
            FileWriter r = new FileWriter(pathName);
            r.write(str);
            r.flush();
            r.close();
            return "ok";
        } catch (IOException ignored) {
        }
        return "Exception";
    }

    public String run(String command, String data){
        switch (command){
            case "getUsers": return get("users");
            case "getLists": return get("lists");
            case "sendUsers":
                return send(data,"users");
            case "sendLists":
                return send(data,"lists");
        }
        return "invalid";
    }

    public static void main(String[] args) throws IOException {
        String pathName = "src/json.json";
        List<String> list = new ArrayList<>();
        try {
            FileReader reader = new FileReader(pathName);
            Path p = Paths.get(pathName);
            list = Files.readAllLines(p);
        } catch (IOException e) {
            e.printStackTrace();
        }

//        Scanner scan  = new Scanner(new File("src/json.json"));
//        FileReader reader = new FileReader("src/json.json");
//        System.out.println(scan.nextLine());
        System.out.println(list);
    }
}
