import java.net.*;
import java.io.*;

class tcpipclient {

	ObjectInputStream Sinput;		// to read the socker
	ObjectOutputStream Soutput;	// towrite on the socket
	Socket socket;

	// Constructor connection receiving a socket number
	tcpipclient(int port) {
		// we use "localhost" as host name, the server is on the same machine
		// but you can put the "real" server name or IP address
		try {
			socket = new Socket("98.250.15.150", port);
		}
		catch(Exception e) {
			System.out.println("Error connectiong to server:" + e);
			return;
		}
		System.out.println("Connection accepted " +
				socket.getInetAddress() + ":" +
				socket.getPort());

		/* Creating both Data Stream */
		try
		{
			Sinput  = new ObjectInputStream(socket.getInputStream());
			Soutput = new ObjectOutputStream(socket.getOutputStream());
		}
		catch (IOException e) {
			System.out.println("Exception creating new Input/output Streams: " + e);
			return;
		}
		// now that I have my connection
		String test = "Hello, good sir. I am a client.";
		// send the string to the server
		System.out.println("Client sending \"" + test + "\" to server");
		try {
			Soutput.writeObject(test);
			Soutput.flush();
		}
		catch(IOException e) {
			System.out.println("Error writting to the socket: " + e);
			return;
		}
		// read back the answer from the server
		String response;
		try {
			response = (String) Sinput.readObject();
			System.out.println("Read back from server: " + response);
		}
		catch(Exception e) {
			System.out.println("Problem reading back from server: " + e);
		}

		try{
			Sinput.close();
			Soutput.close();
		}
		catch(Exception e) {}
	}

	public static void main(String[] arg) {
		new tcpipclient(5000);
	}
}