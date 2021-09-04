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

            migrationBuilder.CreateSequence(
                name: "orderitemseq",
                incrementBy: 10);

            migrationBuilder.CreateSequence(
                name: "orderseq",
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
                name: "orderstatus",
                schema: "inventory",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false, defaultValue: 1),
                    Name = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_orderstatus", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "items",
                schema: "inventory",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false),
                    Code = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Identity = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
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

            migrationBuilder.CreateTable(
                name: "orders",
                schema: "inventory",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false),
                    BuyerId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Observation = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    OrderStatusId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_orders", x => x.Id);
                    table.ForeignKey(
                        name: "FK_orders_orderstatus_OrderStatusId",
                        column: x => x.OrderStatusId,
                        principalSchema: "inventory",
                        principalTable: "orderstatus",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "orderitems",
                schema: "inventory",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false),
                    ProductId = table.Column<int>(type: "int", nullable: false),
                    OrderId = table.Column<int>(type: "int", nullable: false),
                    Amount = table.Column<int>(type: "int", nullable: false),
                    ProductName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ProductPrice = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_orderitems", x => x.Id);
                    table.ForeignKey(
                        name: "FK_orderitems_orders_OrderId",
                        column: x => x.OrderId,
                        principalSchema: "inventory",
                        principalTable: "orders",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_items_ItemStatusId",
                schema: "inventory",
                table: "items",
                column: "ItemStatusId");

            migrationBuilder.CreateIndex(
                name: "IX_orderitems_OrderId",
                schema: "inventory",
                table: "orderitems",
                column: "OrderId");

            migrationBuilder.CreateIndex(
                name: "IX_orders_OrderStatusId",
                schema: "inventory",
                table: "orders",
                column: "OrderStatusId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "items",
                schema: "inventory");

            migrationBuilder.DropTable(
                name: "orderitems",
                schema: "inventory");

            migrationBuilder.DropTable(
                name: "itemstatus",
                schema: "inventory");

            migrationBuilder.DropTable(
                name: "orders",
                schema: "inventory");

            migrationBuilder.DropTable(
                name: "orderstatus",
                schema: "inventory");

            migrationBuilder.DropSequence(
                name: "itemseq",
                schema: "inventory");

            migrationBuilder.DropSequence(
                name: "orderitemseq");

            migrationBuilder.DropSequence(
                name: "orderseq");
        }
    }
}
