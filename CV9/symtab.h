#define MAXSYMS 50
struct symtab {
    char *name;
    double (*funcptr)();
    double value;
};
extern struct symtab syms[MAXSYMS];
struct symtab *symlook(char *);