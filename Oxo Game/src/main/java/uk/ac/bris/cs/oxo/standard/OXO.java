package uk.ac.bris.cs.oxo.standard;

import uk.ac.bris.cs.gamekit.matrix.Matrix;
import uk.ac.bris.cs.gamekit.matrix.SquareMatrix;
import uk.ac.bris.cs.oxo.Cell;
import uk.ac.bris.cs.oxo.Player;
import uk.ac.bris.cs.oxo.Side;
import uk.ac.bris.cs.oxo.Spectator;

public class OXO implements OXOGame {

	private Player noughtSide, crossSide;
	private Side currentSide;
	private int size;

	public OXO(int size, Side startSide, Player nought, Player cross) {
		if (size <= 0) throw new IllegalArgumentException("size invalid");
		if (startSide == null) throw new IllegalArgumentException("side invalid");
		this.size = size;
		this.currentSide = (startSide);
		this.noughtSide = (nought);
		this.crossSide = (cross);
	}

	@Override
	public void registerSpectators(Spectator... spectators) {
		// TODO
		throw new RuntimeException("Implement me");
	}

	@Override
	public void unregisterSpectators(Spectator... spectators) {
		// TODO
		throw new RuntimeException("Implement me");
	}

	@Override
	public void start() {
		// TODO
		throw new RuntimeException("Implement me");
	}

	@Override
	public Matrix<Cell> board() {
		// TODO
		throw new RuntimeException("Implement me");
	}

	@Override
	public Side currentSide() {
		// TODO
		throw new RuntimeException("Implement me");
	}
}
