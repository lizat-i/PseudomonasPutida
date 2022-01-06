function [PHA_Cell] = getPHA_subs()

PHA_Cell = table2cell(readtable('functions/PHA_Metabolism_Subsystem.txt'));

end