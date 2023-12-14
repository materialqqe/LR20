unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.ComCtrls, Vcl.MPlayer, Vcl.Imaging.GIFImg;

type
  TForm2 = class(TForm)
    Timer1: TTimer;
    MediaPlayer1: TMediaPlayer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1:TForm;
  Form2: TForm;


implementation

{$R *.dfm}


procedure TForm2.FormActivate(Sender: TObject);
          begin
  MediaPlayer1.FileName := '‪C:\Users\Евгений\Downloads\RXi9.avi'; // указываем путь к файлу AVI
  MediaPlayer1.Open; // открываем файл
  MediaPlayer1.Play; // запускаем проигрывание
  Timer1.Enabled := True; // включаем таймер на 5 секунд
end;


procedure TForm2.Timer1Timer(Sender: TObject);
begin
 MediaPlayer1.Stop; // останавливаем проигрывание
  Close; // закрываем окно
       end;
end.
