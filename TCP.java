package com.studia;

import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.util.Arrays;

public class TCP extends Thread {

    private String ipAddress;
    private int port;
    private int bufferSize;
    private byte[] filledBuffer;
    private boolean enableNagleAlghoritm;

    public TCP(String ipAddress, int port, int bufferSize, boolean nagleAlgoritm ) {
        this.ipAddress = ipAddress;
        this.enableNagleAlghoritm = nagleAlgoritm;
        this.port = port;
        this.bufferSize = bufferSize;
        this.filledBuffer = new byte[bufferSize];
        Arrays.fill(this.filledBuffer, (byte) 7);
    }

    @Override
    public void run() {
        try {
            Socket socket = new Socket(this.ipAddress, this.port);
            socket.setTcpNoDelay(this.enableNagleAlghoritm);
            DataOutputStream dataOutputStream = new DataOutputStream(socket.getOutputStream());
            String firstMessage = "SIZE:" + this.bufferSize;
            byte[] firstMessageBytes = firstMessage.getBytes();
            dataOutputStream.write(firstMessageBytes, 0, firstMessageBytes.length);
            while (true) {
                Thread.sleep(10);
                dataOutputStream.write(filledBuffer, 0, bufferSize);
            }

        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }
}
