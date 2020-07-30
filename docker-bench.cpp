void run_function(){
  int tmp =10;
  for(int i=0;i<100000;i++){
    tmp = (3 / 5 + 10 + i);
    if(tmp % 5 == 0){
      tmp = i * 10  + i;
    }else{
      tmp = i * 10  - i;
    }
  }
}

int main(){
  for(int i=0;i<100000;i++){
    run_function();
  }
  return 0;
}
