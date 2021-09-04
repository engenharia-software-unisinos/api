using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Inventory.API.Infrastructure.Migrations
{
    public partial class Initial_Create : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.EnsureSchema(
                name: "inventory");

            migrationBuilder.CreateSequence(
                name: "itemseq",
                schema: "inventory",
                incrementBy: 10);

            migrationBuilder.CreateTable(
                name: "itemstatus",
                schema: "inventory",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false, defaultValue: 1),
                    Name = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_itemstatus", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "items",
                schema: "inventory",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false),
                    Code = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Identity = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ItemStatusId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_items", x => x.Id);
                    table.ForeignKey(
                        name: "FK_items_itemstatus_ItemStatusId",
                        column: x => x.ItemStatusId,
                        principalSchema: "inventory",
                        principalTable: "itemstatus",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_items_ItemStatusId",
                schema: "inventory",
                table: "items",
                column: "ItemStatusId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "items",
                schema: "inventory");

            migrationBuilder.DropTable(
                name: "itemstatus",
                schema: "inventory");

            migrationBuilder.DropSequence(
                name: "itemseq",
                schema: "inventory");
        }
    }
}
