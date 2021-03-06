/*
  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/
/*
For beginners tutorial (and user guide) visit:
http://www.openelectrons.com/docs/viewdoc/1
*/

#include <Wire.h>
#include <NXShield.h>
#include <Servo.h>

/*
  History
	----------------------------------
	Author         Date         Comments
	Uday Patil     08/02/2012   Wrote the program and tested.

*/

// setup for this example:
// attach external power to NXShield.
// attach RC servo to Pins 3 (pins are near Bank B-M1)
// use left and right buttons to move servo motor.

Servo myservo;
NXShield Nx;

int pos = 0;

void setup()   {  
  Serial.begin(115200);

  Nx.init(SH_SoftwareI2C);
  myservo.attach(3);
  
}

void loop()                     
{
  boolean left_btn = Nx.getButtonState(BTN_LEFT);
  boolean right_btn = Nx.getButtonState(BTN_RIGHT);
  while (right_btn == true){
    right_btn = Nx.getButtonState(BTN_RIGHT);
    pos +=1;
    myservo.write(pos);
    delay(10);
  }
  while (left_btn == true){
    left_btn = Nx.getButtonState(BTN_LEFT);
    pos -=1;
    myservo.write(pos);
    delay(10);
  }
}

