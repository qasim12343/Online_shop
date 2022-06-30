package Network;

import Controller.Controller;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;

public class ClientHandler extends Thread{
    private final Socket socket;

    public ClientHandler(Socket socket) {
        this.socket = socket;
    }

    @Override
    public void run(){
        try {
            DataInputStream dis = new DataInputStream(socket.getInputStream());
            DataOutputStream dos = new DataOutputStream(socket.getOutputStream());
            StringBuilder request = new StringBuilder();
            int c = dis.read();
            while (c != 0){
                request.append((char)c);
                c = dis.read();
            }
            Scanner in = new Scanner(request.toString());
            String command = in.nextLine();
            StringBuilder data = new StringBuilder();
            while(in.hasNextLine()){
                data.append(in.nextLine()).append("\n");
            }
            System.out.println(command+"  "+ data);
            String response = new Controller().run(command, data.toString());
            System.out.println(response);
            dos.write(response.getBytes(StandardCharsets.UTF_8));
            dos.flush();
            dis.close();
            dos.close();
            socket.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
