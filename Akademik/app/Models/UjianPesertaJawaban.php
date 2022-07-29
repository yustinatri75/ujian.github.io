<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class UjianPesertaJawaban
 * 
 * @property int $id
 * @property int|null $peserta_id
 * @property int|null $soal_id
 * @property int|null $jawaban_id
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property UjianPeserta|null $ujian_peserta
 * @property UjianJawaban|null $ujian_jawaban
 * @property UjianSoal|null $ujian_soal
 *
 * @package App\Models
 */
class UjianPesertaJawaban extends Model
{
	protected $table = 'ujian_peserta_jawaban';

	protected $casts = [
		'peserta_id' => 'int',
		'soal_id' => 'int',
		'jawaban_id' => 'int'
	];

	protected $fillable = [
		'peserta_id',
		'soal_id',
		'jawaban_id'
	];

	public function ujian_peserta()
	{
		return $this->belongsTo(UjianPeserta::class, 'peserta_id');
	}

	public function ujian_jawaban()
	{
		return $this->belongsTo(UjianJawaban::class, 'jawaban_id');
	}

	public function ujian_soal()
	{
		return $this->belongsTo(UjianSoal::class, 'soal_id');
	}
}
