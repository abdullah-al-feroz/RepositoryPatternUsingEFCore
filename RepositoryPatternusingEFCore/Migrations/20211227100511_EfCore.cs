using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace RepositoryPatternusingEFCore.Migrations
{
    public partial class EfCore : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "StudentTeachers",
                columns: table => new
                {
                    StudentTeacherId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    StudentId = table.Column<int>(type: "int", nullable: false),
                    TeacherId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_StudentTeachers", x => x.StudentTeacherId);
                    table.ForeignKey(
                        name: "FK_StudentTeachers_Students_StudentId",
                        column: x => x.StudentId,
                        principalTable: "Students",
                        principalColumn: "StudentId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_StudentTeachers_Teachers_TeacherId",
                        column: x => x.TeacherId,
                        principalTable: "Teachers",
                        principalColumn: "TeacherId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_StudentTeachers_StudentId",
                table: "StudentTeachers",
                column: "StudentId");

            migrationBuilder.CreateIndex(
                name: "IX_StudentTeachers_TeacherId",
                table: "StudentTeachers",
                column: "TeacherId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "StudentTeachers");
        }
    }
}
