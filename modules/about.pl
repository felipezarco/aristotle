% Aristotle's About

:- module(about,[about/0]).

about :-
   not( exists_frame ),
   new( Frame,  frame( 'About - Aristotle' ) ),
   send( Frame, append, new( Dialog, dialog ) ),
   send( Dialog, append, text('Aristotle - Computational Argumentation')),
   send( Dialog, append, new( Editor, editor( new( text_buffer ), 64,10) ) ),
   send( Dialog, append, button( close, message( @prolog, close ) ) ),
   send_list( Editor, append,
   ['Aristotle - Computational Argumentation (Version 1.0.83)\n
     Copyright (c) 2013-2016. S�o Paulo Technological College.
     Department of Information Technology (FATEC-SP/CEETEPS).\n
     Available at http://www.ime.usp.br/~slago/aristotle.zip\n
     This is free software. There is ABSOLUTELY NO WARRANTY.
     Read LICENSE.txt for more information.
       '] ),
   var( about:frame, Frame ),
   send( Editor, font, font( screen, normal, 12 ) ),
   send( Editor, caret, 0),
   send( Editor, editable, @off),
   send( Frame,  open, point( 350, 350 ) ).

exists_frame :-
   var( about:frame, Frame ),
   catch( send( Frame, expose ), Error, true ),
   var( Error ).

close :-
   var( about:frame, Frame ),
   send( Frame, destroy ).










