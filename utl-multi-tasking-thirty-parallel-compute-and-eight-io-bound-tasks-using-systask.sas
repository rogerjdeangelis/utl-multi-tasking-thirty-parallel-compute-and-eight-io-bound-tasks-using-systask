%let pgm=utl-multi-tasking-thirty-parallel-compute-and-eight-io-bound-tasks-using-systask;

  Multi-tasking thirty parallel compute and eight io bound tasks using systask

  github
  https://tinyurl.com/yckzbx3p
  https://github.com/rogerjdeangelis/utl-multi-tasking-thirty-parallel-compute-and-eight-io-bound-tasks-using-systask

  Excellent related paper by David Ward
  https://tinyurl.com/4fj9u68m
  https://sesug.org/proceedings/sesug_2023_final_papers/Development_and_Support/SESUG2023_Paper_111_Final_PDF.pdf

  BENCHMARKS

   1 COMPUTE BOUND

      SECONDS   TASKS

         1470   30 Serial compute bound tasks
           54   30 Parallel compute bound tasks

   2 IO BOUND

         129    8  Serial iIO bound tasks (with index but not spde)
          11    8  Parallel IO bound tasks

   Steps for compute bound example

       a Create spde libname (example uses 6 drives)

           I used partsize of 20Gb per drive (28 might be better)

       b Create and save query macro in your autocall library

       c Create special SAS executable command
         %let _s=%sysfunc(compbl(C:\Progra~1\SASHome\SASFoundation\9.4\sas.exe

           -sysin c:\nul     /* note we will later use -termstmt        ----*/
                             /* execute the macro at sas termination    ----*/

           -sasautos c:\oto  /* where we stoed the macro                ----*/
           -autoexec c:\oto\Tut_Oto.sas
           -work d:\wrk));

       d Note option -termstmt(macro) will execute immediately because -sysin c:\nul in the CLI
          SYSTASK (8 of them)
           systask command "&_s
             -termstmt %spdeget(county=1,st1=A,st2=H,st3=O,st4=T,st5=Z);
             -log spdeget1.log"
              taskname=sys1

       e  Instead of sysparm we use macro arguments, however your code must be wrapped in a macro
          and the macro needs to be in your autocall library. Functional programming?

/*                                   _         _                           _
/ |   ___ ___  _ __ ___  _ __  _   _| |_ ___  | |__   ___  _   _ _ __   __| |
| |  / __/ _ \| `_ ` _ \| `_ \| | | | __/ _ \ | `_ \ / _ \| | | | `_ \ / _` |
| | | (_| (_) | | | | | | |_) | |_| | ||  __/ | |_) | (_) | |_| | | | | (_| |
|_|  \___\___/|_| |_| |_| .__/ \__,_|\__\___| |_.__/ \___/ \__,_|_| |_|\__,_|
                        |_|
*/

/**************************************************************************************************************************/
/*                                  |                                                                      |              */
/*          INPUT                   |                   PROCESS                                            | OUTPUT       */
/*                                  |                                                                      |              */
/*  data _null_;                    |                                                                      | Each         */
/*    retain tot 0;                 | systask command "sas tot.sas -rsasuser -log tot.log" taskname=sys1   | LOG HAS      */
/*    do rec=1 to 1e8;              | systask command "sas tot.sas -rsasuser -log tot.log" taskname=sys2   |              */
/*       x=rec**(1/constant("PI"))* | ...                                                                  | TOT=4.58     */
/*         rec**(1/3)*rec**(1/10);  | systask command "sas tot.sas -rsasuser -log tot.log" taskname=sys30  |              */
/*       tot =  tot + x;            |                                                                      |              */
/*    end;                          |                                                                      |              */
/*    put tot=;                     |                                                                      |              */
/*    stop;                         |                                                                      |              */
/*  run;quit;                       |                                                                      |              */
/*                                                                                                         |              */
/**************************************************************************************************************************/

filename ft15f001 "c:/temp/calc.sas";
parmcards4;
 data _null_;
   retain tot 0;
   do rec=1 to 1e8;
      x=(rec**(1/constant("PI"))*
        rec**(1/3)*rec**(1/10))/rec**2;
      tot =  tot + x;
   end;
   put tot=;
   stop;
 run;quit;
;;;;
run;quit;

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/

%let tym=%sysfunc(time());

systask kill sys1 sys2 sys3 sys4 sys5 sys6 sys7 sys8 sys9 sys10 sys11 sys12 sys13 sys14 sys15
             sys16 sys17 sys18 sys19 sys20 sys21 sys22 sys23 sys24 sys25 sys26 sys27 sys28 sys29 sys30;

systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cacl1.log" taskname=sys1;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cacl2.log" taskname=sys2;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cacl3.log" taskname=sys3;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cacl4.log" taskname=sys4;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cacl5.log" taskname=sys5;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cacl6.log" taskname=sys6;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cacl7.log" taskname=sys7;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cacl8.log" taskname=sys8;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cacl9.log" taskname=sys9;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cac20.log" taskname=sys10;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cac21.log" taskname=sys11;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cac22.log" taskname=sys12;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cac23.log" taskname=sys13;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cac24.log" taskname=sys14;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cac25.log" taskname=sys15;

systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cac32.log" taskname=sys16;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cac33.log" taskname=sys17;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cac34.log" taskname=sys18;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cac35.log" taskname=sys19;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cac36.log" taskname=sys20;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cac37.log" taskname=sys21;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cac38.log" taskname=sys22;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cac39.log" taskname=sys23;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cac40.log" taskname=sys24;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cac41.log" taskname=sys25;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cac42.log" taskname=sys26;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cac43.log" taskname=sys27;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cac44.log" taskname=sys28;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cac45.log" taskname=sys29;
systask command "sas c:/temp/calc.sas -nosplash -rsasuser -log c:/temp/cac46.log" taskname=sys30;

waitfor sys1 sys2 sys3 sys4 sys5 sys6 sys7 sys8 sys9 sys10 sys11 sys12 sys13 sys14 sys15
        sys16 sys17 sys18 sys19 sys20 sys21 sys22 sys23 sys24 sys25 sys26 sys27 sys28 sys29 sys30;


%put %sysevalf( %sysfunc(time()) - &tym);

/*___    _         _                           _
|___ \  (_) ___   | |__   ___  _   _ _ __   __| |
  __) | | |/ _ \  | `_ \ / _ \| | | | `_ \ / _` |
 / __/  | | (_) | | |_) | (_) | |_| | | | | (_| |
|_____| |_|\___/  |_.__/ \___/ \__,_|_| |_|\__,_|

*/
/**************************************************************************************************************************/
/*  _                   _                                                                                                 */
/* (_)_ __  _ __  _   _| |_                                                                                               */
/* | | `_ \| `_ \| | | | __|                                                                                              */
/* | | | | | |_) | |_| | |_                                                                                               */
/* |_|_| |_| .__/ \__,_|\__|                                                                                              */
/*         |_|                                                                                                            */
/*                                                                                                                        */
/* CREATE 154Gb SPDE.GB80 SAS dataset                                                                                     */
/* with asychronous index stacty = (state county);                                                                        */
/*                                                                                                                        */
/*  Obs=1,560,000,000                                                                                                     */
/*                                                                                                                        */
/*  OBS           PAT  COUNTY STATE  FAC1 FAC2 FAC3 FAC4 FAC5 FAC6 FAC7 FAC8 FAC9 FAC10                                   */
/*                                                                                                                        */
/*    1             1     1     A     99   99   99   99   99   99   99   99   99   99                                     */
/*    2             2     1     A     99   99   99   99   99   99   99   99   99   99                                     */
/*    3             3     1     A     99   99   99   99   99   99   99   99   99   99                                     */
/*    4             4     1     A     99   99   99   99   99   99   99   99   99   99                                     */
/*                                                                                                                        */
/* ...                                                                                                                    */
/* 1560000000 7500000    8     Z     99   99   99   99   99   99   99   99   99   99                                      */
/*                                                                                                                        */
/* CREATE AAYNC INDEX                                                                                                     */
/*                                                                                                                        */
/* Proc datasets lib=Spde ;                                                                                               */
/*  modify gb80(ASYNCINDEX=YES);                                                                                          */
/*  index create stacty = (state county);                                                                                 */
/* Run;Quit;                                                                                                              */
/*                                                                                                                        */
/* SYSTASK WILL CALL THIS MACRO EIGHT TIMES                                                                               */
/*                                                                                                                        */
/* %macro spdeget(county=1, st1=A, st2=H, st3=O, st4=T, st5=Z);                                                           */
/*                                                                                                                        */
/*    libname spde spde                                                                                                   */
/*    ('c:\spde_c','d:\spde_d','e:\spde_e','f:\spde_f','g:\spde_g','m:\spde_m')                                           */
/*        metapath =('c:\spde_c\metadata')                                                                                */
/*        indexpath=(                                                                                                     */
/*          'c:\spde_c' ,'d:\spde_d' ,'e:\spde_e' ,'f:\spde_f' ,'g:\spde_g' ,'m:\spde_m')                                 */
/*                                                                                                                        */
/*        datapath=(                                                                                                      */
/*          'c:\spde_c' ,'d:\spde_d' ,'e:\spde_e' ,'f:\spde_f' ,'g:\spde_g' ,'m:\spde_m')                                 */
/*                                                                                                                        */
/*        partsize=10000m                                                                                                 */
/*      ;                                                                                                                 */
/*                                                                                                                        */
/*    libname sd1 "m:/sd1";                                                                                               */
/*    data sd1.county&county;                                                                                             */
/*       set spde.gb80(where=(county=&county and                                                                          */
/*       (state="&st1" or state="&st2" or state="&st3"                                                                    */
/*          or state="&st4" or state="&st5")));                                                                           */
/*    run;quit;                                                                                                           */
/*                                                                                                                        */
/* %mend spdeget;                                                                                                         */
/*                                                                                                                        */
/*  _ __  _ __ ___   ___ ___  ___ ___                                                                                     */
/* | `_ \| `__/ _ \ / __/ _ \/ __/ __|                                                                                    */
/* | |_) | | | (_) | (_|  __/\__ \__ \                                                                                    */
/* | .__/|_|  \___/ \___\___||___/___/                                                                                    */
/* |_|                                                                                                                    */
/*                                                                                                                        */
/* systask command "&_s -termstmt %spdeget(county=1,st1=A,st2=H,st3=O,st4=T,st5=Z); -log spdeget1.log" taskname=sys1;     */
/* systask command "&_s -termstmt %spdeget(county=2,st1=B,st2=I,st3=P,st4=U,st5=Y); -log spdeget2.log" taskname=sys2;     */
/* systask command "&_s -termstmt %spdeget(county=3,st1=C,st2=J,st3=Q,st4=V,st5=W); -log spdeget3.log" taskname=sys3;     */
/* systask command "&_s -termstmt %spdeget(county=4,st1=D,st2=K,st3=R,st4=W,st5=V); -log spdeget4.log" taskname=sys4;     */
/* systask command "&_s -termstmt %spdeget(county=5,st1=E,st2=L,st3=s,st4=X,st5=U); -log spdeget5.log" taskname=sys5;     */
/* systask command "&_s -termstmt %spdeget(county=6,st1=F,st2=M,st3=T,st4=Y,st5=T); -log spdeget6.log" taskname=sys6;     */
/* systask command "&_s -termstmt %spdeget(county=7,st1=G,st2=N,st3=U,st4=Z,st5=S); -log spdeget7.log" taskname=sys7;     */
/* systask command "&_s -termstmt %spdeget(county=8,st1=H,st2=O,st3=V,st4=A,st5=R); -log spdeget8.log" taskname=sys8;     */
/*                                                                                                                        */
/* data sd1.counties/view=sd1.counties;                                                                                   */
/*   set sd1.county:;                                                                                                     */
/* run;quit;                                                                                                              */
/*              _               _                                                                                         */
/*   ___  _   _| |_ _ __  _   _| |_                                                                                       */
/*  / _ \| | | | __| `_ \| | | | __|                                                                                      */
/* | (_) | |_| | |_| |_) | |_| | |_                                                                                       */
/*  \___/ \__,_|\__| .__/ \__,_|\__|                                                                                      */
/*                 |_|                                                                                                    */
/*                                                                                                                        */
/* The CONTENTS Procedure                                                                                                 */
/*                                                                                                                        */
/* Data Set Name        SD1.COUNTIES           Observations          .                                                    */
/* Member Type          VIEW                   Variables             13                                                   */
/* Engine               SASDSV                 Indexes               0                                                    */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*         _                           _   _                   _
(_) ___   | |__   ___  _   _ _ __   __| | (_)_ __  _ __  _   _| |_
| |/ _ \  | `_ \ / _ \| | | | `_ \ / _` | | | `_ \| `_ \| | | | __|
| | (_) | | |_) | (_) | |_| | | | | (_| | | | | | | |_) | |_| | |_
|_|\___/  |_.__/ \___/ \__,_|_| |_|\__,_| |_|_| |_| .__/ \__,_|\__|
                                                  |_|
*/
/*----                                                                   ----*/
/*---- How to determine partsize                                         ----*/
/*----                                                                   ----*/
/*----  The input dataset will be about 160Gb so make                    ----*/
/*----  each of the of the 8 drives contain partsize=20Gdb               ----*/
/*----  8*20Gb = 160Gb                                                   ----*/
/*----                                                                   ----*/

How to determine partsize

 The input dataset will be about 160Gb so make
 each of the of the 8 drives contain partsize=20Gdb
 8*20Gb = 160Gb


libname spde spde ('c:\spde_c','d:\spde_d','e:\spde_e','f:\spde_f','g:\spde_g','m:\spde_m')

    metapath =('c:\spde_c\metadata')

    indexpath=(
       'c:\spde_c' ,'d:\spde_d' ,'e:\spde_e' ,'f:\spde_f' ,'g:\spde_g' ,'m:\spde_m')

    datapath=(
       'c:\spde_c' ,'d:\spde_d' ,'e:\spde_e' ,'f:\spde_f' ,'g:\spde_g' ,'m:\spde_m')

    partsize=20000m
  ;

/*----  Create 154Gb Input                                               ----*/
data spde.gb80 (bufsize=128k);
  array facs[10] fac1-fac10 (10*99);
  retain fac1-fac10;
  do county=1 to 8;
     do state=&lettersq;
        do pat=1 to 7500000;
           output;
        end;
     end;
  end;
run;quit;

/*----  Create compound index                                            ----*/
Proc datasets lib=Spde ;
 modify gb80(ASYNCINDEX=YES);
 index create stacty = (state county);
Run;Quit;

/*
(_) ___    _ __  _ __ ___   ___ ___  ___ ___
| |/ _ \  | `_ \| `__/ _ \ / __/ _ \/ __/ __|
| | (_) | | |_) | | | (_) | (_|  __/\__ \__ \
|_|\___/  | .__/|_|  \___/ \___\___||___/___/
          |_|
*/

/*----                                                                   ----*/
/*---- save macro to subset the 154Gb dataset in sasautos                ----*/
/*----                                                                   ----*/

filename ft15f001 "c:/oto/spdeget.sas";
parmcards4;
%macro spdeget(county=1, st1=A, st2=H, st3=O, st4=T, st5=Z);
   libname spde spde
   ('c:\spde_c','d:\spde_d','e:\spde_e','f:\spde_f','g:\spde_g','m:\spde_m')
       metapath =('c:\spde_c\metadata')
       indexpath=(
             'c:\spde_c'
             ,'d:\spde_d'
             ,'e:\spde_e'
             ,'f:\spde_f'
             ,'g:\spde_g'
             ,'m:\spde_m')
       datapath=(
             'c:\spde_c'
             ,'d:\spde_d'
             ,'e:\spde_e'
             ,'f:\spde_f'
             ,'g:\spde_g'
             ,'m:\spde_m')

       partsize=10000m
     ;

   libname sd1 "m:/sd1";

   data sd1.county&county;
      set spde.gb80(where=(county=&county and
      (state="&st1" or state="&st2" or state="&st3"
         or state="&st4" or state="&st5")));
   run;quit;

%mend spdeget;
;;;;
run;quit;

/*---- Test Interactively                                                ----*/

%spdeget(county=1, st1=A, st2=H, st3=O, st4=T, st5=Z);



/*          ____ _     ___
(_) ___    / ___| |   |_ _|
| |/ _ \  | |   | |    | |
| | (_) | | |___| |___ | |
|_|\___/   \____|_____|___|

*/

%let _s=%sysfunc(compbl(C:\Progra~1\SASHome\SASFoundation\9.4\sas.exe
     -sysin c:\nul
     -sasautos c:\oto
     -nosplash
     -autoexec c:\oto\Tut_Oto.sas
     -work d:\wrk));

/*    _       _     _                   _            _
  ___(_) __ _| |__ | |_   ___ _   _ ___| |_ __ _ ___| | _____
 / _ \ |/ _` | `_ \| __| / __| | | / __| __/ _` / __| |/ / __|
|  __/ | (_| | | | | |_  \__ \ |_| \__ \ || (_| \__ \   <\__ \
 \___|_|\__, |_| |_|\__| |___/\__, |___/\__\__,_|___/_|\_\___/
        |___/                 |___/
*/
options noxwait noxsync;
%let tym=%sysfunc(time());
systask kill sys1 sys2 sys3 sys4  sys5 sys6 sys7 sys8;
systask command "&_s -termstmt %nrstr(%spdeget(county=1,st1=A,st2=H,st3=O,st4=T,st5=Z);) -log d:\log\spdeget1.log" taskname=sys1;
systask command "&_s -termstmt %nrstr(%spdeget(county=2,st1=B,st2=I,st3=P,st4=U,st5=Y);) -log d:\log\spdeget2.log" taskname=sys2;
systask command "&_s -termstmt %nrstr(%spdeget(county=3,st1=C,st2=J,st3=Q,st4=V,st5=W);) -log d:\log\spdeget3.log" taskname=sys3;
systask command "&_s -termstmt %nrstr(%spdeget(county=4,st1=D,st2=K,st3=R,st4=W,st5=V);) -log d:\log\spdeget4.log" taskname=sys4;
systask command "&_s -termstmt %nrstr(%spdeget(county=5,st1=E,st2=L,st3=s,st4=X,st5=U);) -log d:\log\spdeget5.log" taskname=sys5;
systask command "&_s -termstmt %nrstr(%spdeget(county=6,st1=F,st2=M,st3=T,st4=Y,st5=T);) -log d:\log\spdeget6.log" taskname=sys6;
systask command "&_s -termstmt %nrstr(%spdeget(county=7,st1=G,st2=N,st3=U,st4=Z,st5=S);) -log d:\log\spdeget7.log" taskname=sys7;
systask command "&_s -termstmt %nrstr(%spdeget(county=8,st1=H,st2=O,st3=V,st4=A,st5=R);) -log d:\log\spdeget8.log" taskname=sys8;
waitfor sys1 sys2 sys3 sys4  sys5 sys6 sys7 sys8;
%put %sysevalf( %sysfunc(time()) - &tym);?

* VIEW to put back together;
libname sd1 "m:/sd1";
data counties/view=counties;
  set sd1.countie:;
  by rand;
run;quit;

/*                     _               _
(_) ___     ___  _   _| |_ _ __  _   _| |_
| |/ _ \   / _ \| | | | __| `_ \| | | | __|
| | (_) | | (_) | |_| | |_| |_) | |_| | |_
|_|\___/   \___/ \__,_|\__| .__/ \__,_|\__|
                          |_|
*/

You may get a comment thta no log output was produces, but the logs sre there.
It may be that the cli expected sysin to produce a log.

The CONTENTS Procedure

Data Set Name        SD1.COUNTIES           Observations          .
Member Type          VIEW                   Variables             13
Engine               SASDSV                 Indexes               0

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
