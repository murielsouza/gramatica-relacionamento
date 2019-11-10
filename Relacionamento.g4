grammar Relacionamento;

/*regras sintáticas*/
relacionamento : line+ EOF;
line : pessoa ',' relacao;
relacao : (tiposRelacao pessoa caracteristica? ','?)+;
pessoa : LETRAS;

dia : NUMBER;
mes : NUMBER;
ano : NUMBER;
data : dia '/' mes '/' ano;
tempo : 'dia' 's'? | 'mes' 'es'? | 'ano' 's'? ;
tiposRelacao : 'casado' '(a)'? 'com' | 'pai de' | 'mãe de' | 'irma' '(o)'? 'de' | 'amigo' '(a)'? 'de' | 'filho de';
caracteristica : 'em' data | 'ha' NUMBER tempo;


/*regras léxicas*/
fragment LOWERCASE: [a-z];
fragment UPPERCASE: [A-Z];
fragment DIGIT: [0-9];
LETRAS: (LOWERCASE | UPPERCASE | '_')+;
WHITESPACE: (' ' | '\t') -> skip;
NEWLINE: ('\r'? '\n' | '\r')+ -> skip;
NUMBER: DIGIT+ ([.,] DIGIT+)?;
