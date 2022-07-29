<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class UjianJawaban
 * 
 * @property int $id
 * @property int|null $soal_id
 * @property string|null $jawaban
 * @property float|null $skor
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property Collection|UjianPesertaJawaban[] $ujian_peserta_jawabans
 *
 * @package App\Models
 */
class UjianJawaban extends Model
{
	protected $table = 'ujian_jawaban';

	protected $casts = [
		'soal_id' => 'int',
		'skor' => 'float'
	];

	protected $fillable = [
		'soal_id',
		'jawaban',
		'skor'
	];

	public function ujian_peserta_jawabans()
	{
		return $this->hasMany(UjianPesertaJawaban::class, 'jawaban_id');
	}
}
