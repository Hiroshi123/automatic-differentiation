

#include "tree.hpp"

struct Calc {
  
  std::istream* ip;
  //Tree tree;
  std::unique_ptr<Tree> tree;//(new Tree());
  
  Calc(std::istream& s) : ip{&s} {
    
    tree.reset(new Tree());
    
    //std::unique_ptr<Tree> tree(new Tree());
    
    
  };
  
  /*
    following is a kind of lexical analysis
  */
  
  
  Symbol get(){
    
    Symbol symbol;
    
    char ch = 0;
    *ip >> ch;
    
    std::cout << ch << std::endl;
    
    if( ch == 0 ){
      symbol.token = Token::end;
      //std::cout << "d"kaigyo\n";
      return symbol;
    }
    
    if('0' <= ch && ch <= '9'){
      
      symbol.token = Token::number;
      symbol.value = ch; //('0'-ch);
      
      return symbol;
      
    }
    
    if(ch == '+' || ch == '-' || ch == '*' || ch == '/'){
      symbol.token = Token::bao;
      symbol.value = ch;
      return symbol;
    }
    
    if(ch == '('){
      symbol.token = Token::lp;
      symbol.value = ch;
      return symbol;
    }
    
    if(ch == ')'){
      symbol.token = Token::rp;
      symbol.value = ch;
      return symbol;
    }
    
    if(ch == ';'){
      symbol.token = Token::end;
      
      //std::cout << "kaigyo\n";
      
      return symbol;
    };
    
    symbol.token = Token::error;
    symbol.value = ch;
    return symbol;
    
  };
  
  void tentativeLoop(){

    
    Symbol t;
    
    for(size_t i = 0 ; i < 10 ; i++){
      
      std::cout << "->";
      t = get();
      if(i == 0){
	tree->init(t);
      } else{
	tree->expr(t);
      }
      
      
    }
    
  }
  
  void main_loop(){
    
    // Symbol t;
    
    // for(;;){
    //   std::cout << "->";
    //   t = get();
      
    //   if( t.token == Token::error) {
    // 	std::cerr << "error!" << std::endl;
    // 	break;
    //   }
      
    //   if( t.token == Token::end )
    // 	break;
      
    //   if(t.token == Token::bao ){
	
    // 	tree->add_left(t);
	
    // 	//continue;
    //   }
      
      
      
    //   if(t.token == Token::number){
    // 	tree->add_left(t);
    // 	tree->add_right(get());
    //   }
      
    //   //tree.add_right(get());
    //   //add_right();
      
    // };
      
  };
  
  void expr(){
    
    //char* a = new char[3];
    //a[0] = 'a';
    //std::cout << a[0] << std::endl;
    
    //std::cout << "this is expr!" << std::endl;
    
    //int* a[5] = new int[5];
    
    //int a = new int[5];
    
  }
  
  void inputStream(){
    
  };
  
  void count(){
    
    //tree.collectNode();
    
  };
  
};

