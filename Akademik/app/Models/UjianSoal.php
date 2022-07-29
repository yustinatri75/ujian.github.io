<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class UjianSoal
 * 
 * @property int $id
 * @property string|null $soal
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property Collection|UjianPesertaJawaban[] $ujian_peserta_jawabans
 *
 * @package App\Models
 */
class UjianSoal extends Model
{
	protected $table = 'ujian_soal';

	protected $fillable = [
		'soal'
	];

	public function ujian_peserta_jawabans()
	{
		return $this->hasMany(UjianPesertaJawaban::class, 'soal_id');
	}
}
