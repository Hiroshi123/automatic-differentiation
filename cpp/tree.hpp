


#include <stack>
//#include "node.hpp"

//#pragma once

#include "constant.hpp"
#include "variable.hpp"
#include "operator.hpp"

class Tree {
  
  static Node* sta ;
  static int* d;
  
  std::stack<Operator**> mstack;
  
  Operator* base;
  
  // std::unique_ptr<Node> root;
  // std::shared_ptr<Node> branch;
  
  //std::shared_ptr<Node> current;
  
  Operator** current;
  
  
public:
  
  Tree() {
    base = new Operator();
  };
  
  void init(const Symbol& t){
    
    if(t.token == Token::lp){
      
      std::cout << "init:" << base->pp << std::endl;
      
      mstack.push(base->pp);
      
      base->twin._left.reset(new Operator());
      base->some = 100;
      current = base->twin._left->pp;
      
    } else {
      
      std::cout << "error!!!!" << std::endl;
      
    }
    
  }
  
  void expr(const Symbol& t){
    
    //std::unique_ptr<Node> c;
    
    Node** tmp = (*current)->expR(t);
    
    if(tmp == current){
      
    } else if(tmp == nullptr){
      
      std::cout << "!!" << std::endl;
      std::cout << "before " << current << std::endl;
      current = mstack.top();
      mstack.pop();
      std::cout << "after " << current << std::endl;
      
    } else {
      
      mstack.push(current);
      current = tmp;
      std::cout << ",," << std::endl;
      
    };
    
  };
  
};

