package com.studia;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.MulticastSocket;
import java.util.Arrays;

public class UDP extends Thread {

    private DatagramSocket datagramSocket;
    private String ipAddress;
    private int port;
    private int bufferSize;
    private byte[] filledBuffer;
    private boolean sending;

    public UDP(final int port, final String ipAddress, final int bufferSize) {
        this.port = port;
        this.ipAddress = ipAddress;
        this.bufferSize = bufferSize;
        this.sending = true;
        this.filledBuffer = new byte[bufferSize];
        Arrays.fill(this.filledBuffer, (byte) 4);
    }

    @Override
    public void run() {
        try {
            this.datagramSocket = new MulticastSocket();
            InetAddress inetAddress = InetAddress.getByName(this.ipAddress);
            byte[] firstMessage = ("SIZE:" + this.bufferSize).getBytes();
            DatagramPacket datagramPacket = new DatagramPacket(firstMessage, firstMessage.length, inetAddress, this.port);
            datagramSocket.send(datagramPacket);
            while (sending) {
                Thread.sleep(10);
                DatagramPacket datagramPacket1 = new DatagramPacket(filledBuffer, filledBuffer.length, inetAddress, this.port);
                datagramSocket.send(datagramPacket1);
            }
            this.datagramSocket.close();
            System.out.println("connection closed");

        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }
}
