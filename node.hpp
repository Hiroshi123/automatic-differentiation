

#include "symbol.hpp"
#include <memory>

class Tree;

// class Operator;
// class Node;
// class Variable;

class Node {
  
  friend Tree;
  
protected:
  
  
  size_t state = 0;
  size_t _state = 0;
  
  struct Parent {
    std::shared_ptr<Node> _mom;
  } parent;
  
  // struct Twin {
    
  //   //std::shared_ptr<Node> _left;
  //   //std::shared_ptr<Node> _right;
    
  //   std::unique_ptr<Node> _left;
  //   std::unique_ptr<Node> _right;
    
  // } twin ;
  
  // const std::function<Node**(const Symbol) > setSymbol = [&](const Symbol s){
    
  //   symbol = s;
  //   _state ++;
    
  //   std::cout << "setSymbol!!" << std::endl;
  //   std::cout << pp << std::endl;
    
  //   return pp;
  // };
  
  // const std::function<Node**(const Symbol) > addLeft = [&](const Symbol s){
    
  //   twin._left.reset( new Node() );
  //   twin._left->symbol = s;
    
  //   //twin._left->parent._mom.reset(this);
    
  //   std::cout << "addLeft!!" << std::endl;
  //   _state ++;
  //   return pp;
  // };
  
  // const std::function<Node**(const Symbol) > addRight = [&](const Symbol s){
    
  //   _state ++;
  //   twin._right.reset( new Node() );
  //   twin._right->symbol = s;
  //   //twin._right->parent._mom.reset(this);
  //   std::cout << "addRight!!" << std::endl;
  //   return pp;
  // };
  
  // const std::function<Node**(const Symbol) > downLeft = [&](const Symbol s ){
    
  //   _state ++;
  //   twin._left.reset( new Node() );
  //   std::cout << "downLeft!!" << std::endl;
  //   return twin._left->pp;
    
  // };
  
  // const std::function<Node**(const Symbol) > downRight = [&] (const Symbol s ){
    
  //   twin._right.reset( new Node() );
  //   std::cout << "downRight!!" << std::endl;
  //   return twin._right->pp;
    
  // };
  
  
  // const std::function<Node**(const Symbol) > up = [&](const Symbol s ){
  //   std::cout << "up!!" << std::endl;
  //   //static Node* n = nullptr;
  //   //std::cout << n << std::endl;
  //   return nullptr;  
  // };
  
  
public:

  Symbol symbol;
  
  int some;
  
  Node()  {
    
    // p = this;
    // std::cout << this << "/" << p << std::endl;
    // pp = &p;
    // std::cout << this << "/" << p << "/" << pp << std::endl;
    
    //state = 0;
    
  };
  
  Node(size_t x){
    
  };
  
  // Node* add_left(const Symbol& t);
  // Node* add_right(const Symbol& t);
  // size_t count(size_t n = 0);
  
  void init(const Symbol& t){
    
  };
  
  // Node** expr(const Symbol& t){
    
  //   std::cout << "stateB" << _state << std::endl;
  //   std::string res = Grammer::get(_state,t.token);
  //   std::cout << "stateA" << _state << std::endl;
    
  //   if(res == "set_symbol"){
      
  //     return setSymbol(t);
      
  //     // symbol = t;
  //     // std::cout << symbol.value << std::endl;
  //     // _state++;
      
  //   } else if(res == "add_left"){
      
  //     return addLeft(t);
      
  //   } else if( res == "add_right" ) {
      
  //     return addRight(t);
      
  //   } else if( res ==  "down_left" ){
      
  //     return downLeft(t);
      
  //   } else if( res ==  "down_right" ){
      
  //     return downRight(t);
      
  //   } else if(res == "up") {
      
  //     return up(t);
      
  //   }
    
  //   //return &n;
    
  // };
  
};  
  
