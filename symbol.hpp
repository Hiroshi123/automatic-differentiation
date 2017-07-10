
#include <istream>
#include <iostream>
#include <string>
#include <map>
#include <vector>


enum class Token : char {
  
  name , number , end , bao , error, parenthesis , lp , rp , variable, constant , 
    plus ='+',minus = '-', mul = '*', div = '/', assign = '='
    
    };


struct Symbol {
  
  Token token;
  //std::string str_value;
  //double value;
  
  char value;
  
};

struct Lex {
  
  static const std::vector<std::tuple<char,Token> > instructions;
  
private:
  
  static const std::vector<std::tuple<char,Token> > create();
  
};

const std::vector<std::tuple<char,Token>> Lex::create() {
  
  std::vector<std::tuple<char,Token> > v;
  
  v.reserve(8);
  
  v[0] = std::make_tuple('+',Token::bao);
  v[1] = std::make_tuple('-',Token::bao);
  v[2] = std::make_tuple('*',Token::bao);
  v[3] = std::make_tuple('/',Token::bao);
  
  // v[1] = std::make_tuple(1,Token::lp,"down");
  // v[2] = std::make_tuple(1,Token::constant,"add_left");
  // v[3] = std::make_tuple(1,Token::variable,"add_left");
  
  // v[4] = std::make_tuple(1,Token::lp,"down");
  // v[5] = std::make_tuple(2,Token::constant,"add_right");
  // v[6] = std::make_tuple(2,Token::variable,"add_right");
  
  // v[7] = std::make_tuple(3,Token::rp,"up");
  
  return v;
  
};

struct Grammer {
  
  static const std::vector<std::tuple<size_t,Token,std::string> > instructions;
  static const size_t size = 8;
  
  /* get grammer */
  
  static std::string get(size_t state,const Token token) {
    
    for(size_t i = 0 ; i < size ; i++ ) {
      
      if((state == std::get<0>(instructions[i]))  && (token == std::get<1>(instructions[i]) )  ){
	return std::get<2>(instructions[i]);
      }
      
    }
    
    return "";
    
  };
  
private:
  
  static const std::vector<std::tuple<size_t,Token,std::string> > create();
  
};

const std::vector<std::tuple<size_t,Token,std::string> > Grammer::create() {
  
  std::vector<std::tuple<size_t,Token,std::string> > v;
  
  v.reserve(8);
  
  v[0] = std::make_tuple(0,Token::bao,"set_symbol");
  
  v[1] = std::make_tuple(1,Token::lp,"down_left");
  v[2] = std::make_tuple(1,Token::number,"add_left");
  v[3] = std::make_tuple(1,Token::variable,"add_left");
  
  v[4] = std::make_tuple(2,Token::lp,"down_right");
  v[5] = std::make_tuple(2,Token::number,"add_right");
  v[6] = std::make_tuple(2,Token::variable,"add_right");
  
  v[7] = std::make_tuple(3,Token::rp,"up");
  
  return v;
  
};

const std::vector<std::tuple<char,Token>> Lex::instructions = Lex::create();
const std::vector<std::tuple<size_t,Token,std::string> > Grammer::instructions = Grammer::create();


