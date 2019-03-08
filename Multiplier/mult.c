int main(){
int multiplicand = 120;
int multiplier = 10;
int product = 0;
int index = 0;
int testBit = 0;


    for (index = 0; index < 32;++ index){

        printf("mltnd: %d  mltlr: %d  product: %d   lsb %d \n\n",multiplicand,multiplier,product,(multiplier & 0x1));

        if(multiplier & 0x1){
            product = product + multiplicand;
        }
        else{
            product = product + 0;
        }
        multiplicand = multiplicand << 1;
        multiplier   = multiplier   >> 1;


    }


return 0;
}
