module Ncrs
  module Libcrs
    @[Link(ldflags: "#{__DIR__}/ncurses/libncurses.so")]
    lib Win
      alias WINDOW = LibC::Int
      type NCURSES_ATTR_T = LibC::Int
      type Stdscr = WINDOW


      fun stdscr() : LibC::Int*
      fun initscr() : LibC::Int
      fun printw(LibC::Char*) : LibC::Int
      fun refresh() : LibC::Int
      fun getch() : LibC::Int
      fun endwin() : LibC::Int
      fun raw() : LibC::Int
      fun noecho() : LibC::Int
      fun keypad(WINDOW* , Bool) : LibC::Int
      fun attron(LibC::Int) : LibC::Int
      fun attroff(LibC::Int) : LibC::Int
    end

    def key_f(n : Int32)
      n + 0o410
    end
  end

  include Libcrs

  class Ui
    private def stdscr()
      Libcrs::Win.stdscr
    end
    
    def initialize()
      @@init = Libcrs::Win.initscr()
      p "initialize Ui class #{__LINE__}"
    end

    def ptrln(st : String, style : Int32 = -1)
      if style == -1
        Libcrs::Win.printw("\n#{st}")
      else
        Libcrs::Win.attron(style)
        Libcrs::Win.printw("\n#{st}")
        Libcrs::Win.attroff(style)
      end
    end

    def ptr(st : String, style : Int32 = -1)
      if style == -1
        Libcrs::Win.printw("#{st}")
      else
        Libcrs::Win.attron(style)
        Libcrs::Win.printw("#{st}")
        Libcrs::Win.attroff(style)
      end
    end
    
    def ref()
      Libcrs::Win.refresh()
    end

    def input(msg : String = "")
      ptrln(msg)
      return Libcrs::Win.getch
    end

    def input_chr(msg : String = "")
      ptrln(msg)
      return Libcrs::Win.getch().unsafe_chr
    end

    def raw()
      Libcrs::Win.raw()
    end

    def keypad(b : Bool)
      Libcrs::Win.keypad(stdscr(), b)
    end

    def noecho()
      Libcrs::Win.noecho()
    end

    def key_f(n : Int32)
      n + 0o410
    end
    
    def end()
      @@close = Libcrs::Win.endwin()
      p "close Ui class #{__LINE__}"
    end 
  end
end
