CREATE INDEX idx_TurmaAlocada_Semestre_Rodada ON turmaalocada(Semestre,Rodada);
CREATE INDEX idx_Turma_Semestre_Professor ON turma(Semestre,CodProf);
CREATE INDEX idx_Turma_Professor ON turma(CodProf);
CREATE INDEX idx_AreaInteresse_Matricula ON areainteresse(Matricula);
CREATE INDEX idx_TurmaSolicitada_Semestre_CodTurma ON TurmaSolicitada(Semestre,CodTurma);