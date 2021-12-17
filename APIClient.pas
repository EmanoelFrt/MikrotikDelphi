unit APIClient;

interface

uses
  SysUtils, RouterOSAPI, ssl_openssl;

type
    TAPIClient = class
  private
  public
    constructor Create;
    destructor Destroy; override;
  end;

var
  ROS: TRosApiClient;
  ResListen: TRosApiResult;
  IP : String;
  function Conectar(ConnIP, UserName, Password : String) : Boolean;

implementation

constructor TAPIClient.Create;
begin
  inherited Create;
  ROS := TRosApiClient.Create;
  ResListen := nil;
end;

destructor TAPIClient.Destroy;
begin
  ROS.Free;
  inherited Destroy;
end;

function Conectar(ConnIP, UserName, Password : String) : Boolean;
var
  Res: TRosApiResult;
begin
  IP     := ConnIP;
  Result := ROS.Connect(IP, UserName, Password);

  if not Result then
    raise Exception.Create('Erro de Conexão: ' + ROS.LastError);
end;

end.
