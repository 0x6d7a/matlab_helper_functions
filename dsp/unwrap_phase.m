function [unwrap_phase,diffPhaseCorrectCum] = unwrap_phase(phase, prephase, diffPhaseCorrectCum)
  diffPhase = phase - prephase;
  if(diffPhase > pi)
    diffPhaseMod = diffPhase - 2 * pi;
  elseif(diffPhase < -pi)
    diffPhaseMod = diffPhase + 2 * pi;
  else
    diffPhaseMod = diffPhase;
  end

  if(diffPhaseMod == -pi && diffPhase > 0)
    diffPhaseMod = pi;
  end

  diffPhaseCorrect = diffPhaseMod - diffPhase;

  if(abs(diffPhaseCorrect) < pi)
    diffPhaseCorrect = 0;
  end

  diffPhaseCorrectCum = diffPhaseCorrectCum + diffPhaseCorrect;
  unwrap_phase = phase + diffPhaseCorrectCum;

end
