program dpraddmad;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  SysUtils,
  StrUtils,
  Classes;

var
  lstDpr: TStrings;
  sDprFile: string;
  i: integer;
  x, c: integer;
begin
  lstDpr := TStringList.Create;
  try
    sDprFile := ParamStr(1);
    if sDprFile <> '' then
    begin
      lstDpr.LoadFromFile(sDprFile);

      i := lstDpr.IndexOf('uses') + 1;
      if not ContainsText(lstDpr.Text, 'madExcept') then
      begin
        lstDpr.Insert(i, 'madExcept,madLinkDisAsm,madListHardware,madListProcesses,madListModules,');

        lstDpr.SaveToFile(sDprFile);
      end;
    end
    else
    begin
      Writeln('dpraddmad <project.dpr>');
    end;
  finally
    lstDpr.Free;
  end;

  ExitCode := 0;
end.
