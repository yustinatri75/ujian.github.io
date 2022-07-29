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
 * @property int|null $sesi_id
 * @property string|null $soal
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 *
 * @property UjianSession|null $ujian_session
 * @property Collection|UjianJawaban[] $ujian_jawabans
 * @property Collection|UjianPesertaJawaban[] $ujian_peserta_jawabans
 *
 * @package App\Models
 */
class UjianSoal extends Model
{
	protected $table = 'ujian_soal';

	protected $casts = [
		'sesi_id' => 'int'
	];

	protected $guarded = ['id'];

	public function ujian_session()
	{
		return $this->belongsTo(UjianSession::class, 'sesi_id');
	}

	public function ujian_jawabans()
	{
		return $this->hasMany(UjianJawaban::class, 'soal_id');
	}

	public function ujian_peserta_jawabans()
	{
		return $this->hasMany(UjianPesertaJawaban::class, 'soal_id');
	}
}
