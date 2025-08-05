// Coin plate for Pre-decimal Coinage
// https://en.wikipedia.org/wiki/Coins_of_the_pound_sterling
// All measurements in mm
// https://openscad.org/

// WIDTH OF PLATE - CROWN + TOLERANCE
MAX_THICK=2.89+0.5;

// 6x4' standard for photo frames - TOLERANCE
WIDTH=4*25.4-1;
HEIGHT=6*25.4-1;

// COIN DIAMETERS
COIN_WIGGLE=1;
TWO_SHILLING_D=28.5;
ONE_SHILLING_D=23.6;
THREE_PENCE_D=28.5;
SIX_PENCE_D=19.41;
ONE_PENCE_D=31;
CROWN_D=38;
ONE_SHILLING_SC_D=23.6;
HALF_PENCE_D=25.48;

// LOCATIONS, X, Y FROM BOTTOM LEFT OF PHOTO
H = HEIGHT;
W = WIDTH;
COINS = [[TWO_SHILLING_D,W/4,5*H/6],[ONE_SHILLING_D,W/4,H/2],[THREE_PENCE_D,W/4,H/6],[SIX_PENCE_D,W/2,2*H/3],[ONE_PENCE_D,W/2,1*H/3],[CROWN_D,3*W/4,5*H/6],[ONE_SHILLING_SC_D,3*W/4,H/2],[HALF_PENCE_D,3*W/4,H/6]];

difference(){
    cube([WIDTH,HEIGHT,MAX_THICK],center = true);
    translate([-WIDTH/2,-HEIGHT/2]){
        for (i = [ 0 : len(COINS) - 1 ]) {
            coin = COINS[i];
            translate([coin[1],coin[2]]){
                cylinder(MAX_THICK+COIN_WIGGLE,d=coin[0],center=true);
            }
        }
    }
}