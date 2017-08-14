import ddf.minim.*;
import ddf.minim.analysis.*;
 
AudioPlayer player;
Minim minim;
AudioInput in;
FFT fourier;
String note;
String song="GuileTheme_StreetFighterII.mp3"; //Archivo elegido para la reproducción en programa. Debe encontrarse en la misma dirección que el archivo .pde.
int n;
float hz;
float midi;
int noteNumber;
 
int rate= 44100;
 
float [] max= new float [rate/2];
float maxamp;
float freq;
 
void setup()
{
  size(600,600);
 
  minim = new Minim(this);
  player = minim.loadFile(song, 2048);
  player.play();
  minim.debugOn();
  in = minim.getLineIn(Minim.MONO, 4096, rate);
  fourier = new FFT(in.left.size(), rate);
  frameRate(10);
  strokeWeight(4);
}
 
void draw()
{
 background(0);
  fill(255);
  textSize(20);
  text (freq-6+" hz", 90, 55);
  
  textSize(15);
  text ("note "+note, 90, 80);
  text("Song-o-Gram", 40,555);
  text(song, 40, 575); //Aparecerá automáticamente el nombre del archivo o canción elegida para reproducción
  
  findNote();
}
 
void findNote() 
{
 fourier.forward(in.left);
  for (int f=0;f<rate/2;f++) 
  { 
    max[f]=fourier.getFreq(float(f));  
  }
    
  maxamp=max(max);
 
  for (int i=0; i<max.length; i++) 
    {
      if (max[i] == maxamp) 
        {
          freq= i;
        }
    }
 
  midi= 69+12*(log((freq-6)/440));
  n= int (midi);//cast to int
 
 
      if (n%12==0)
      {
        note=("c"); // Do | C - Amarillo  
        fill(240, 240, 20);
        rect(40,40,40,40);
        
        line(random(300,550), random(300,550), random(300,550), random(300,550)); //Se eligen estas dimensiones para que el dibujo de las notas no interfiera con las anotaciones que se tienen dentro de la ventana
        stroke(240, 240, 20);
       }
    
      if (n%12==1)
      {
        note=("c#"); // Do# | C# - Azul Marino
        fill(0, 0, 130);
        rect(40,40,40,40);
       
        triangle(random(height/4), random(width/4), random(height/4), random(width/4), random(height/4), random(height/4)); //Se busca que sean figuras pequeñas, para representar la elevación de medio tono que se tiene en cada sostenido
        stroke(0, 0, 130);
      }
 
      if (n%12==2)
      {
        note=("d"); // Re | D - Rojo
        fill(130, 0, 0);
        rect(40,40,40,40);
        
        line(random(300,550), random(300,550), random(300,550), random(300,550));
        stroke(130, 0, 0);
      }
 
      if (n%12==3)
      {
        note=("d#"); // Re# | D# - Verde Esmeralda
        fill(0, 150, 120);
        rect(40,40,40,40);
        
       triangle(random(height/4), random(width/4), random(height/4), random(width/4), random(height/4), random(height/4));
       stroke(0, 150, 120);
       noFill();
      }
 
      if (n%12==4)
      {
        note=("e"); // Mi | E - Púrpura
        fill(100, 0, 60);
        rect(40,40,40,40);

        line(random(300,550), random(300,550), random(300,550), random(300,550));
        stroke(100, 0, 60);
      }
 
      if (n%12==5)
      {
        note=("f"); // Fa | F - Amarillo Verdoso
        fill(220, 215, 0);
        rect(40,40,40,40);

        line(random(300,550), random(300,550), random(300,550), random(300,550));
        stroke(220, 215, 0);
      }
 
      if (n%12==6)
      {
        note=("f#"); // Fa# | F# - Azul Rey
        fill(30, 30, 70);
        rect(40,40,40,40);
        
        triangle(random(height/4), random(width/4), random(height/4), random(width/4), random(height/4), random(height/4));
        stroke(30, 30, 70);
      }
 
      if (n%12==7)
      {
        note=("g"); // Sol | G - Naranja
        fill(205, 130, 35);
        rect(40,40,40,40);
        

        line(random(300,550), random(300,550), random(300,550), random(300,550));
        stroke(205, 130, 35);
      }
 
      if (n%12==8)
      {
        note=("g#"); // Sol# | G# - Cyan
        fill(90, 160, 225);
        rect(40,40,40,40);
        

        triangle(random(height/4), random(width/4), random(height/4), random(width/4), random(height/4), random(height/4));
        stroke(90, 160, 225);
      }
    
      if (n%12==9)
      {
        note=("a"); // La | A - Rojo Carmín
        fill(150, 0, 25);
        rect(40,40,40,40);
        

        line(random(300,550), random(300,550), random(300,550), random(300,550));
        stroke(150, 0, 25);
      }
 
      if (n%12==10)
      {
        note=("a#"); // La# | A# - Verde
        fill(0, 150, 0);
        rect(40,40,40,40);
        

        triangle(random(height/4), random(width/4), random(height/4), random(width/4), random(height/4), random(height/4));
        stroke(0, 150, 0);
      }
 
      if (n%12==11)
      {
        note=("b"); // Si | B - Violeta
        fill(130, 0, 140);
        rect(40,40,40,40);
        
        line(random(300,550), random(300,550), random(300,550), random(300,550));
        stroke(130, 0, 140);
      }
  }

void stop()
{
  in.close();
  minim.stop();
 
  super.stop();
}