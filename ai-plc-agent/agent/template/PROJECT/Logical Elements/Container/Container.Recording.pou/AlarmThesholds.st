XXThreshold := TO_INT(TO_REAL(LevelMaximum - LevelMinimum) * 0.02);
XThreshold := TO_INT(TO_REAL(LevelMaximum - LevelMinimum) * 0.05);
LevelHiHi := LevelMaximum - XXThreshold;
LevelHi := LevelMaximum - XThreshold;
LevelLo := LevelMinimum + XThreshold;
LevelLoLo := LevelMinimum + XXThreshold;