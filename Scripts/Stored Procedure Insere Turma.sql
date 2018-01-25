USE `trablabbd`;
DROP procedure IF EXISTS `sp_insereTurma`;

DELIMITER $$
USE `trablabbd`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE sp_insereTurma
	(
    IN v_dis CHAR(6),
    IN v_tur CHAR(6),
    IN v_sem CHAR(5),
	IN v_pro INT,
    IN v_hor VARCHAR(80)
    )
BEGIN
	IF EXISTS (SELECT * FROM  `disciplina` WHERE CodDis = v_dis) THEN
		INSERT INTO `turma`
        (
        CodDisc,
        CodTurma,
        Semestre,
        CodProf,
        Horario,
        TravaAlocacao,
        TurmaAtiva
        )
		VALUES
        (
        v_dis,
        v_tur,
        v_sem,
        v_pro,
        v_hor,
        '0',
        '1'
        );
	ELSE
		SELECT 'Código de Disciplina Inexistente!'  AS Msg;
	END IF;
END;$$

DELIMITER ;
