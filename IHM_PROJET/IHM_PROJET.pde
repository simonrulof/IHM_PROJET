// Importations CHAT

PImage imgbubulles;
PImage bulletin;
PImage babybullebas;
PImage babybullehaut;
PImage microphone;
PImage pj;
PImage smiley;

// Importations PROFIL

PImage imgPP;
PImage imgInsta;
PImage imgTik;
PImage imgFb;
PImage imgParam;
PImage imgRetour;

// imporations CONNEXION

PImage logo;

// importations RECHERCHE

PImage loupe;

// importations COULEURS

color fondEcran = color(240,238,237);
color barreHautBas = color(125,196,178);
color couleurBoutons = color(80,227,194);
color couleurBoutonConnexion = color(18,168,152);

// Programme PRINCIPAL

machineEtat mae;

void setup()
{
  size(480,720);
  
  mae = machineEtat.CONNEXION;
  
  logo = loadImage("connexion/logo_small.png");
  
  loupe = loadImage("recherche/loupe.png");
  size(480,720);   //telephone taille 480 par 720
  
  imgbubulles = loadImage("chat/bubulle.png");
  bulletin = loadImage("chat/bulletin.jpg");
  babybullebas = loadImage("chat/babybullebas.png");
  babybullehaut = loadImage("chat/babybullehaut.png");
  microphone = loadImage("chat/microphone.png");
  pj = loadImage("chat/piecejointe.png");
  smiley = loadImage("chat/smiley.png");
  
  imgPP = loadImage("profil/profil_vide.jpg");
  imgPP.resize(150,150); // redimensionnement selon taille fenetre
  imgInsta = loadImage("profil/logo_instagram.png");
  imgInsta.resize(75,75); // redimensionnement selon taille fenetre
  imgTik = loadImage("profil/logo_tiktok.jpg");
  imgTik.resize(75,75); // redimensionnement selon taille fenetre
  imgFb = loadImage("profil/logo_facebook.jpg");
  imgFb.resize(75,75); // redimensionnement selon taille fenetre
  imgParam = loadImage("global/parametre.png"); //récup image
  imgParam.resize(50,50);
  imgRetour = loadImage("global/bouton_retour.png"); //récup image
  imgRetour.resize(50,50);
}

void draw()
{
  switch (mae) {
    case CONNEXION:
      draw_connexion();
    break;
    case INTERFACEPRINCIPALE:
      draw_interfacePrincipale();
    break;
    case RECHERCHE:
      draw_recherche();
    break;
    case PROFIL:
      draw_profil();
    break;
    
    case CHAT:
      draw_chat();
    break;
    
    case BULLETIN:
      draw_bulletin();
    break;
    
    default:
      draw_profil();
    break;
  }
}

// Gestion CLIC

void mouseReleased()
{
  switch(mae) {
  
    case PROFIL:
      if (mouseX >= 0 && mouseX <= height/20 && mouseY >= 0 && mouseY <= height/20){
        mae = machineEtat.RECHERCHE;
      }
      if (mouseX >= 20 && mouseX <= 460 && mouseY >= 380 && mouseY <= 430) { // si appuie sur le bouton chat
        mae = machineEtat.CHAT;
      }
      if (mouseX >= 20 && mouseY >= 300 && mouseX <= 460 && mouseY <= 350){
        mae = machineEtat.BULLETIN;
      }
      break;
      
    case CHAT:
      if (mouseX >= 25 && mouseX <= 75 && mouseY >= 30 && mouseY <= 80) { // si appuie sur le bouton retour
        mae = machineEtat.PROFIL;
      }
      break;
    case CONNEXION:
      if (mouseX >= width/3 && mouseX <= 2*width/3 && mouseY >= 158*height/200 && mouseY <= (158*height/200) + height/15){
        mae = machineEtat.INTERFACEPRINCIPALE;
      }
      break;
    case INTERFACEPRINCIPALE:
      if (mouseX >= 0 && mouseX <= height/20 && mouseY >= 0 && mouseY <= height/20){
        mae = machineEtat.CONNEXION;
      }
      if (mouseX >= width/20 && mouseY >= height/2 && mouseX <=  (width/20) + (9*width/10) && mouseY <= (height/2) + (height/10)){
        mae = machineEtat.RECHERCHE;
      }
      break;
    case RECHERCHE:
      if (mouseX >= 0 && mouseX <= height/20 && mouseY >= 0 && mouseY <= height/20){
        mae = machineEtat.INTERFACEPRINCIPALE;
      }
      if (mouseX >= width/20 && mouseY >= 5 + 3*height/10 && mouseX <= 18*width/20 + width/20 && mouseY <= 3*height/20 + 5 + 3*height/10){
        mae = machineEtat.PROFIL;
      }
    break;
    case BULLETIN:
      if (mouseX >= 0 && mouseX <= height/20 && mouseY >= 0 && mouseY <= height/20){
        mae = machineEtat.PROFIL;
      }
  }
}

// Impression CHAT

void draw_chat(){
  textAlign(LEFT, BOTTOM);
  background(color(255,255,255));
  
  //fond beige
  fill(240,238,237);
  rect(10,10, 460, 700,28);
   
   //rectangle haut bleu
   fill(125,196,178);
   rect(10,10, 460, 80,28,28,0,0);
   
   //rectangle bas bleu
   fill(125,196,178);
   rect(10,630, 460, 80,0,0,28,28);
   fill(0,170,255);
   noStroke();
   rect(266,100,192, 235);
    
   fill(240,238,237);
   rect(30,650, 360, 45,28);
    
    
    image(babybullebas,263,320);
    image(babybullehaut,260,100);
    image(imgbubulles, 10,350);
    image(imgRetour,25,30);
    image(bulletin,290,125);
    image(imgParam,405,28);
    image(microphone,410,650);
    image(pj,350,660);
    image(smiley,40,660);
    
     //ajout texte en blanc
    textSize(35);                
    fill(255);                   
    text("DUPOND", 210, 70);    
    fill(255);                   
    text("Jacob", 100,70);     
    
    textSize(20);                
    text("Je vous remercie pour cette", 40, 400);   
     text("correction", 40, 430);
    text("Des questions ?", 260, 498);    
    text("Non", 41, 535);    
    text("Bonne journée, à demain", 180, 582);
}

// Impression PROFIL

void draw_profil()
{
  textAlign(LEFT, BOTTOM);
  background(color(200,198,197));
  
  fill(barreHautBas);
  noStroke();
  rect(0,0,480,720/20);
  rect(0,721,480,-720/10);
  
  image(imgPP, 20, 55);        //positionnement image photo profil
  image(imgInsta, 35, 550);    //positionnement im insta
  image(imgTik, 200, 550);     //positionnement im tiktok
  image(imgFb, 370, 550);      //positionnement im facebook
  image(imgParam, 9*width/10, (height/20)+10, (width/8)-20, (width/8)-20);      //positionnement im facebook
  image(imgRetour, 2, 2, height/20 -4, height/20 -4);

  textSize(35);                //ajout texte
  fill(255);                   //mise à blanc de la couleur
  text("DUPOND", 190, 110);    //ecriture
  fill(255);                   //on change laisse la couleur du pinceau en blanc
  text("Jacob", 190, 170);     //ecriture
  stroke(255, 0, 0);           //on change la couleur du pinceau pour contour rectangle
  noFill();                    //on ne remplit pas les rectangle
  rect(360, 138, 80, 35);      //on dessine le rectangle
  fill(255,0,0);               //on change la couleur du pinceau en rouge
  text("15.7", 360, 176);      //on ecrit le texte en rouge
  
  /* Rectangle vers Bulletin */
  fill(barreHautBas);          //on change la couleur du pinceau en vert/bleu (couleur appli a peu pres)
  stroke(153);                 //changement couleur contour (grisé dans ce cas ci)
  rect(20, 300, 440, 50);      //on dessine le rectangle
  fill(255);                   //on change la couleur du pinceau en blanc
  text("Bulletin",180, 340);   //on ecrit le texte en blanc sur le rectangle précédent
  
  /* Rectangle vers Chat */
  fill(barreHautBas);          //on change la couleur du pinceau en vert/bleu (couleur appli a peu pres)
  stroke(153);                 //changement couleur contour (grisé dans ce cas ci)
  rect(20, 380, 440, 50);      //on dessine le rectangle
  fill(255);                   //on change la couleur du pinceau en blanc
  text("Chat",205, 420);       //on ecrit le texte en blanc sur le rectangle précédent
}


void draw_connexion(){
      textAlign(CENTER, CENTER);
      background(fondEcran);
     
      fill(barreHautBas);
      noStroke();
      rect(0,0, width, height/20);
      rect(0, height, width, -height/10);
      
      image(logo, width/4, height/6, width/2, 1.25*(width/4));
      image(imgParam, 9*width/10, (height/20)+10, (width/8)-20, (width/8)-20);
      
      fill(couleurBoutons);
      rect(width/20, height/2, 9*width/10, height/10);
      rect(width/20, 13*height/20, 9*width/10, height/10);
      
      fill(couleurBoutonConnexion);
      rect(width/3, 158*height/200, width/3, height/15, 120);
      
      fill(fondEcran);
      textSize(50);
      text("Identifiant", (width/2), height/2 + height/25);
      text("Mot de passe", (width/2), 13*height/20 + height/25);
      
      textSize(25);
      text("Connexion", (width/2), 158*height/200 + height/35);
}

void draw_interfacePrincipale(){
      textAlign(CENTER, CENTER);
      background(fondEcran);
     
      fill(barreHautBas);
      noStroke();
      rect(0,0, width, height/20);
      rect(0, height, width, -height/10);
      
      image(imgParam, 9*width/10, (height/20)+10, (width/8)-20, (width/8)-20);
      image(imgRetour, 2, 2, height/20 -4, height/20 -4);
      
      fill(couleurBoutons);
      rect(width/20, height/2, 9*width/10, height/10);
      rect(width/20, height/2 + height/10 + height/30, 9*width/10, height/10);
      rect(width/20, height/2 + 2*height/10 + 2*height/30, 9*width/10, height/10);
      
      textSize(50);
      fill(132);
      text("M.Machin\nprofesseur", width/2, height/4);
      
      textSize(40);
      fill(fondEcran);
      text("Rechercher un élève", width/2, height/2 + height/20);
      text("Emploi du temps", width/2, height/2 + height/10 + height/30 + height/20);
      text("Classe", width/2, height/2 + 2*height/10 + 2*height/30 + height/20);
}

void draw_recherche(){
      textAlign(LEFT, CENTER);
      background(fondEcran);
      fill(barreHautBas);
      noStroke();
      rect(0,0, width, height/20);
      rect(0, height, width, -height/10);
      image(imgParam, 9*width/10, (height/20)+10, (width/8)-20, (width/8)-20);
      image(imgRetour, 2, 2, height/20 -4, height/20 -4);
      
      
      fill(255);
      rect(width/20, height/5, 15*width/20, height/10);
      fill(90,238,211);
      rect(16*width/20, height/5, 3*width/20, height/10);
      fill(132);
      textSize(30);
      fill(135);
      text("Recherche eleve...", (width/20) + 10, 5*height/20);
      image(loupe, 16*width/20+5, height/5+5, 3*width/20-10, height/10-10);
      
      fill(255);
      rect(width/20, 5 + 3*height/10, 18*width/20, 3*height/20);
      image(imgPP, width/20 + 5, 5 + 3*height/10 + 5, 3*height/20 - 10, 3*height/20 - 10);
      fill(50);
      text("Jacob Dupont", width/20 + 3*height/20 + 5, 3*height/10 + (3*height/20)/4);
      text("1A STRI", width/20 + 3*height/20 + 5,3*height/10 + 3*(3*height/20)/4);
      fill(255);
      rect(width/20, 10 + 3*height/10 + 3*height/20, 18*width/20, 3*height/20);
      image(imgPP, 5 + width/20, 15 + 3*height/10 + 3*height/20, 3*height/20 - 10, 3*height/20 - 10);
      fill(50);
      text("Pierre Ducobu", width/20 + 3*height/20 + 5,  5 + 3*height/10 + 3*height/20 + (3*height/20)/4);
      text("1A STRI", width/20 + 3*height/20 + 5,  5 + 3*height/10 + 3*height/20 + 3*(3*height/20)/4);
}

void draw_bulletin(){
      background(fondEcran);
      fill(barreHautBas);
      noStroke();
      rect(0,0, width, height/20);
      rect(0, height, width, -height/10);
      image(imgParam, 9*width/10, (height/20)+10, (width/8)-20, (width/8)-20);
      image(imgRetour, 2, 2, height/20 -4, height/20 -4);
      
      textAlign(CENTER, CENTER);
      textSize(50);
      fill(100);
      text("Dernières notes", width/2, height/8);
      textSize(30);
      text("DUPOND Jacob" , width/2, 3*height/16 + 15);
      int decalage = 1*height/4;
      textSize(35);
      String matieres[] = {"UML", "Informatique", "Automatique", "SHS", "EPS"};
      String notes[] = {"12/20","15/20","9/20","17/20","14/20"};
      for(int i = 0; i < 5; i++){
        fill(255);
        rect(width/10, decalage, 8*width/10, height/10);
        fill(100);
        textAlign(LEFT, CENTER);
        text(matieres[i], width/10 + 5, decalage + height/20 - 5);
        textAlign(RIGHT, CENTER);
        text(notes[i], 9*width/10 - 5, decalage + height/20 - 5);
        decalage = decalage + height/10 + 8;
      }
      fill(255);
      textAlign(CENTER, CENTER);
      rect(width/5-10, decalage, 3*width/5+20, height/13);
      fill(100);
      textSize(30);
      text("Télécharger Bulletin", width/2, decalage + height/26);
      
        
}
