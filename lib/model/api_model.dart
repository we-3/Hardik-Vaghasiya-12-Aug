class ApiModel{
  String UserName;
  String Password;
  String SerialNumber;
  String SessionHostId;
  String HostName;
  String LoginProvider;
  String LastSeen;

  ApiModel({required this.UserName, required this.Password, required this.SerialNumber, 
  required this.SessionHostId ,required this.HostName, required this.LoginProvider, required this.LastSeen});
}