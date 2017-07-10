

class Operator : public Node {

  struct Twin {
    
    //std::shared_ptr<Node> _left;
    //std::shared_ptr<Node> _right;
    
    //std::unique_ptr<Node> _left;
    //std::unique_ptr<Node> _right;

    Node* _left;
    Node* _right;
    
    
  } twin ;
  
  
  const std::function<Operator**(const Symbol) > setS = [&](const Symbol s){
    
    symbol = s;
    _state ++;
    
    std::cout << "setSymbol!!" << std::endl;
    //std::cout << pp << std::endl;
    
    return pp;
  };
  
  const std::function<Operator**(const Symbol) > addL = [&](const Symbol s) {
    
    if(true){
      //twin._left.reset( new Constant() );
      twin._left = new Constant();
      
    } else {
      //twin._left.reset( new Constant() );
    }
    
    twin._left->symbol = s;
    
    //twin._left->parent._mom.reset(this);
    
    std::cout << "addLeft!!" << std::endl;
    _state ++;
    
    return pp;
  };

  const std::function<Operator**(const Symbol) > addR = [&](const Symbol s){
    
    _state ++;
    //twin._right.reset( new Constant() );
    twin._right = new Constant();
    twin._right->symbol = s;
    //twin._right->parent._mom.reset(this);
    std::cout << "addRight!!" << std::endl;
    return pp;
  };
  
  const std::function<Operator**(const Symbol) > downL = [&](const Symbol s ){
    
    _state ++;
    
    //twin._left.reset( new Operator() );

    twin._left = new Operator();
    
    
    //Operator* a = static_cast<Operator*>(twin._left);
    
    std::cout << "downLeft!!" << std::endl;
    
    return twin._left->pp;    
  };
  
  const std::function<Node**(const Symbol) > downR = [&] (const Symbol s ){
    
    _state ++;
    twin._right.reset( new Operator() );
    std::cout << "downRight!!" << std::endl;
    return twin._right->pp;
    
  };
  
  const std::function<Operator**(const Symbol) > uP = [&](const Symbol s ){
    
    std::cout << "up!!" << std::endl;
    return nullptr;
    
  };
  
  
public:
  
  /* pointer and pointer of pointer should be single */
  Operator* p;
  Operator** pp;/* indirection for creating stack pointer */
  
  
  Operator(){
    
    p = this;
    std::cout << this << "/" << p << std::endl;
    pp = &p;
    std::cout << this << "/" << p << "/" << pp << std::endl;
    
  };

  Operator** expR(const Symbol& t){
    
    //std::cout << "stateB" << _state << std::endl;
    std::string res = Grammer::get(_state,t.token);
    
    //std::cout << "stateA" << _state << std::endl;
    
    if(res == "set_symbol"){
      
      return setS(t);
      
      // symbol = t;
      // std::cout << symbol.value << std::endl;
      // _state++;
      
    } else if(res == "add_left"){
      
      return addL(t);
      
    } else if( res == "add_right" ) {
      
      return addR(t);
      
    } else if( res ==  "down_left" ){
      
      return downL(t);
      
    } else if( res ==  "down_right" ){
      
      return downR(t);
      
    } else if(res == "up") {
      
      return uP(t);
      
    }
    
  };

  
};

