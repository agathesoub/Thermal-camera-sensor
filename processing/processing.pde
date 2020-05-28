//Set up variables for serial input  
import processing.serial.*;
Serial mySerial; //create object from Serial class
PrintWriter output;

//Find the serial port Arduino is connected to and set up our serial object to listen 
void setup() {
   mySerial = new Serial( this, Serial.list()[0], 9600 ); //The input [0] here should match the COM of the Adruino
   output = createWriter( "data.txt" ); //Specify the filename to output
}
void draw() {
    if (mySerial.available() > 0 ) { //if data is available
         String value = mySerial.readString(); //read and store in value
         if ( value != null ) {
              output.println( value ); //print the value in the file
         }
    }
}

void keyPressed() {
    output.flush();  // Writes the remaining data to the file
    output.close();  // Finishes the file
    exit();  // Stops the program
}
