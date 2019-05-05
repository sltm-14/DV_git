
int main(void)
{

    /* Write your code here */
   	int Q = 0;
	int D = 14435;
	int R = 0;
	int i = 0;
	int ALU_r = 0;

	/* This for loop should be replaced. By default this loop allows a single stepping. */
        printf("\n\n");
        printf("\nD: %d, R: %d, Q: %d\n\n\n",D,R,Q);
		for ( i = 7; i >= 0; i-- ){
                R = ALU_r;
                printf("-------------------------------------------------------------------------------------");
                printf("\n   ALU R IN: %d\n",R);
				if (ALU_r >= 0){
                    printf("\n       R: %d\n",(R << 2));
					R =  ((R << 2) | ((D >> (i + i)) & 3));
                    printf("\n   RD OR: %d\n",R);
                    printf("                                 SUB I: %d, ALU A: %d, ALU B: %d\n",i,R, (Q << 2)| 1);
					ALU_r = R -( (Q << 2) | 1);


				}
				else{
                    printf("\n       R: %d\n",(R << 2));
					R = (R << 2) | (D >> (i + i) & 3);
					printf("\n    RD OR: %d\n",R);
					printf("                                 ADD I: %d, ALU A: %d, ALU B: %d\n",i,R, (Q << 2)| 3);
					ALU_r = R + ((Q << 2) | 3);


				}
				printf("       D: %d\n",D>>(i+i));



				if (ALU_r >= 0){
					Q = (Q << 1) | 1;
					printf("                                 OR 1\n");
				}
				else{//msb = 1
					Q = (Q << 1) | 0;
					printf("                                 OR 0\n");
				}

               // printf("                                                       ALU R: %d\n",R);
                printf("       Q: %d\n",Q);
        }


		if (R<0)
				R = R + ((Q << 1) | 1);

		printf("\n   R: %d, Q: %d",R,Q);

    /* Never leave main */
    return 0;
}
