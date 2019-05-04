module pc_controller(input pcwrite,
                     input branch,
                     input zero,
                     output pcen);

    wire and_out;

    and pc_and(and_out, branch, zero);
    or pc_or(pcen, pcwrite, and_out);

endmodule // pc_controller