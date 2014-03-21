
char *libintl_gettext(const char *_input)
{
   static char buffer[1000] = "Hallo";
   strncpy(buffer,_input,999);
   return buffer;
}

void libintl_textdomain(){}
void libintl_bindtextdomain(){}
