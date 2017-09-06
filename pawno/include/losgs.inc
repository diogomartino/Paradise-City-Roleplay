/*
native CreateLog(const file[]);
native WriteLog(const file[], string[]);
native RemoveLog(const file[]);
native LogExists(const file[]);
*/

#define LogExists fexist

stock CreateLog(const file[])
{
    if(LogExists(file ) )
    {
        print("--------------------------------------------------------------------");
        printf("Losgs: Você está tentando criar um log já existente (%s)", file);
        print("Losgs: Consulte o tópico oficial para mais informações.");
        print("Losgs: http://forum.sa-mp.com/showthread.php?t=293534");
        print("--------------------------------------------------------------------");
        return 0;
    }

    new
        File: logFile = fopen(file, io_write);

    fclose(logFile);

    return 1;
}

stock WriteLog(const file[], string[], maxlength = sizeof(string))
{
    if(!LogExists(file))
        CreateLog(file);

    new
        year,
        month,
        day,
        hour,
        minute,
        second,
        stringLog[600];

    getdate(year, month, day);
    gettime(hour, minute, second);

    format(stringLog, maxlength + 27, "(%02d/%02d/%d)[%02d:%02d:%02d] %s\r\n", day, month, year, hour, minute, second, string);

    new
        File: logFile = fopen(file, io_append);

    fwrite(logFile, stringLog);
    fclose(logFile);

    return 1;
}

stock RemoveLog(const file[])
{
    if(!LogExists(file))
    {
        print("--------------------------------------------------------------------");
        printf("Losgs: Você está tentando deletar um log que não existe (%s)", file);
        print("Losgs: Consulte o tópico oficial para mais informações.");
        print("Losgs: http://forum.sa-mp.com/showthread.php?t=293534");
        print("--------------------------------------------------------------------");
        return 0;
    }

    fremove(file);

    return 1;
}