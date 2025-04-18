
namespace ReactApp1.Server
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            
            //��������� ������������
            builder.Services.AddControllers();
  
            builder.Services.AddOpenApi();

            builder.Services.AddCors(options =>
            {
                options.AddPolicy("ReactPolicy", builder =>
                {
                    builder.WithOrigins("https://localhost:57112") // ��� React-����
                           .AllowAnyHeader()
                           .AllowAnyMethod()
                           .AllowCredentials(); // ���� ����������� ����/�����������
                });
            });

            var app = builder.Build();

            app.UseDefaultFiles();
            app.MapStaticAssets();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.MapOpenApi();
            }

            //app.UseHttpsRedirection();
            app.UseCors("ReactPolicy");
            app.UseAuthorization();

            //�������������� �������� � �����������
            app.MapControllers();

            app.MapFallbackToFile("/index.html");

            app.Run();
        }
    }
}
