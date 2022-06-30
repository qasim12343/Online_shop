package Network;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {
    static Socket socket;
    public static void  start() {
        try {
            ServerSocket serverSocket = new ServerSocket(4040);
            while (true){
                socket = serverSocket.accept();
                System.out.println("connected");
                ClientHandler clientHandler = new ClientHandler(socket);
                clientHandler.start();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
